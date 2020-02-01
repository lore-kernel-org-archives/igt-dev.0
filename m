Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 13:28:11 -0000
Message-ID: <158056369111.32691.14244946400336810368@emeril.freedesktop.org>
References: <20200130012358.5798-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200130012358.5798-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915/gem=5Fmadvise=3A_Us?=
 =?utf-8?q?e_gem=5Fmmap=5F=5Fdevice=5Fcoherent?=
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

Series: series starting with [i-g-t,1/2] tests/i915/gem_madvise: Use gem_mmap__device_coherent
URL   : https://patchwork.freedesktop.org/series/72755/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7839_full -> IGTPW_4038_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4038_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4038_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4038_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][1] -> [TIMEOUT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4038_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_offset@clear:
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([i915#478])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-snb4/igt@gem_mmap_offset@clear.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-snb1/igt@gem_mmap_offset@clear.html

  * igt@gem_wait@write-busy-vcs1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +9 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb4/igt@gem_wait@write-busy-vcs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb5/igt@gem_wait@write-busy-vcs1.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([CI#80] / [i915#58] / [k.org#198133])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-glk8/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103665])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#31])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-apl7/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-apl8/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109276]) +15 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][25] ([i915#694]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-hsw2/igt@gem_caching@reads.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-hsw5/igt@gem_caching@reads.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][27] ([fdo#112080]) -> [PASS][28] +12 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][29] ([i915#677]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#112146]) -> [PASS][32] +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][33] ([fdo#109276]) -> [PASS][34] +16 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][35] ([i915#413]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-kbl6/igt@i915_suspend@sysfs-reader.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][39] ([i915#79]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-apl2/igt@kms_flip@flip-vs-expired-vblank.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-apl2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [SKIP][41] ([i915#668]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][45] ([fdo#109441]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][47] ([i915#831]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [FAIL][50] ([IGT#28]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-apl:          [INCOMPLETE][51] ([CI#80] / [fdo#103927]) -> [TIMEOUT][52] ([fdo#112271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-apl2/igt@gem_eio@in-flight-contexts-10ms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-apl7/igt@gem_eio@in-flight-contexts-10ms.html
    - shard-glk:          [INCOMPLETE][53] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][54] ([fdo#112271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-glk9/igt@gem_eio@in-flight-contexts-10ms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-glk8/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-apl:          [TIMEOUT][55] ([fdo#112271]) -> [INCOMPLETE][56] ([CI#80] / [fdo#103927]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-apl1/igt@gem_eio@in-flight-contexts-1us.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-apl8/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][57] ([i915#694]) -> [FAIL][58] ([i915#818])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-hsw5/igt@gem_tiled_blits@normal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][59] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][60] ([fdo#111870] / [i915#478]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][61] ([i915#454]) -> [SKIP][62] ([i915#468])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
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
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5406 -> IGTPW_4038
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7839: 41a9319a45aaf77e220c8101d6ce76ec66036ffc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html
  IGT_5406: 786c79af483a9f6e4688811f74116030c734ca1f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
