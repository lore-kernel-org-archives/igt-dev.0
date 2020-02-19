Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 11:02:12 -0000
Message-ID: <158211013299.21061.16813933471844414664@emeril.freedesktop.org>
References: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
In-Reply-To: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_new_apis_for_coherent_mmap?=
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
To: "Telukuntla, Sreedhar" <sreedhar.telukuntla@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce new apis for coherent mmap
URL   : https://patchwork.freedesktop.org/series/73543/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7957_full -> IGTPW_4168_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4168_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4168_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4168_full:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@mmap:
    - shard-tglb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-tglb5/igt@fbdev@mmap.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-tglb3/igt@fbdev@mmap.html
    - shard-iclb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb3/igt@fbdev@mmap.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb7/igt@fbdev@mmap.html

  
Known issues
------------

  Here are the changes found in IGTPW_4168_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@mmap:
    - shard-apl:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-apl6/igt@fbdev@mmap.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-apl2/igt@fbdev@mmap.html
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-glk2/igt@fbdev@mmap.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-glk3/igt@fbdev@mmap.html
    - shard-hsw:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw7/igt@fbdev@mmap.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw6/igt@fbdev@mmap.html
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-kbl1/igt@fbdev@mmap.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-kbl2/igt@fbdev@mmap.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +14 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb8/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-glk7/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-c:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw6/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-c.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw7/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-c.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112080]) +9 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#831])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][29] ([fdo#112080]) -> [PASS][30] +15 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][31] ([i915#977]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-tglb7/igt@gem_busy@close-race.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-tglb2/igt@gem_busy@close-race.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [FAIL][33] ([i915#1241]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][35] ([i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][39] ([i915#694]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][43] ([i915#644]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_vm_create@isolation:
    - shard-glk:          [FAIL][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-glk4/igt@gem_vm_create@isolation.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-glk4/igt@gem_vm_create@isolation.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][47] ([i915#413]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-tglb8/igt@i915_pm_rps@waitboost.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-tglb3/igt@i915_pm_rps@waitboost.html
    - shard-iclb:         [FAIL][49] ([i915#413]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180] / [i915#56]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-kbl1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [FAIL][59] ([i915#49]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-tglb:         [SKIP][61] ([i915#668]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-tglb1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-tglb6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][63] ([i915#173]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb1/igt@kms_psr@no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +13 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][69] ([i915#694]) -> [FAIL][70] ([i915#818])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][71] ([i915#818]) -> [FAIL][72] ([i915#694])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-hsw2/igt@gem_tiled_blits@normal.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][73] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][74] ([fdo#111870] / [i915#478])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7957/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5445 -> IGTPW_4168
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7957: 3ceb00d5a5d62566c5979edcbf06df2c15b62b80 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4168: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/index.html
  IGT_5445: 21e523814d692978d6d04ba85eadd67fcbd88b7e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4168/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
