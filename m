Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 12:45:14 -0000
Message-ID: <158341231491.17235.3986989193431015209@emeril.freedesktop.org>
References: <20200304132457.13258-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200304132457.13258-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgZ2VtX3dz?=
 =?utf-8?q?im=3A_Fix_calibration_for_default_and_virtual_engine?=
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

Series: gem_wsim: Fix calibration for default and virtual engine
URL   : https://patchwork.freedesktop.org/series/74267/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8065_full -> IGTPW_4257_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html

Known issues
------------

  Here are the changes found in IGTPW_4257_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +16 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@preempt-hang-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@gem_exec_schedule@preempt-hang-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb8/igt@gem_exec_schedule@preempt-hang-bsd1.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb6/igt@gem_exec_schedule@preempt-other-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb4/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-apl4/igt@gem_workarounds@suspend-resume.html
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([fdo#103665])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl3/igt@gem_workarounds@suspend-resume.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-hsw7/igt@i915_pm_rpm@gem-execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-hsw5/igt@i915_pm_rpm@gem-execbuf.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#1316])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@i915_pm_rpm@gem-execbuf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-glk9/igt@i915_pm_rpm@gem-execbuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-tglb5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#413])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#96])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#61])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-hsw8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-hsw8/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-hsw7/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +12 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][43] ([i915#644]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-apl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][51] ([i915#899]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@kms_psr@psr2_basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [INCOMPLETE][58] ([i915#1381])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [INCOMPLETE][60] ([i915#1381])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd1.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-hsw:          [DMESG-WARN][61] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][62] ([fdo#111870])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
    - shard-snb:          [DMESG-WARN][63] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][64] ([fdo#111870] / [i915#478])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5491 -> IGTPW_4257
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8065: e50ed1b1ef982f7648ca558f1cfd16ad3190e094 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4257: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html
  IGT_5491: d52794b426ae16630cc1e0354ae435ec98f6174b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
