Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 14:29:59 -0000
Message-ID: <158013539928.9687.17063032455505694482@emeril.freedesktop.org>
References: <20200125000135.7315-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200125000135.7315-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fmmap=5Fwc=3A_Skip_gtt_test_if_aperture_is_missing_?=
 =?utf-8?b?KHJldjIp?=
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

Series: tests/i915/gem_mmap_wc: Skip gtt test if aperture is missing (rev2)
URL   : https://patchwork.freedesktop.org/series/72553/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7811_full -> IGTPW_3995_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3995_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3995_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3995_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-hsw6/igt@gem_partial_pwrite_pread@reads.html

  
Known issues
------------

  Here are the changes found in IGTPW_3995_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb1/igt@gem_mmap_gtt@fault-concurrent.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-snb1/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#168])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl4/igt@kms_color@pipe-b-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-apl3/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#168])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl4/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#168])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-glk9/igt@kms_color@pipe-b-ctm-max.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-glk5/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][25] -> [INCOMPLETE][26] ([i915#82])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb4/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-snb1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#668])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl3/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-apl3/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl2/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-kbl3/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +9 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb3/igt@perf_pmu@busy-accuracy-98-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +16 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [fdo#112080]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb4/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][45] ([fdo#111870] / [i915#478]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][49] ([i915#553] / [i915#725]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw1/igt@i915_selftest@live_blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][59] ([i915#61]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][61] ([i915#140] / [i915#250]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][63] ([i915#173]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb1/igt@kms_psr@no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +14 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][67] ([fdo#109276] / [fdo#112080]) -> [FAIL][68] ([IGT#28])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][70] ([fdo#110789] / [fdo#111870] / [i915#478])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][71] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][72] ([fdo#111870] / [i915#478])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][73] ([i915#694]) -> [INCOMPLETE][74] ([i915#61])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw2/igt@gen7_exec_parse@basic-allocation.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5384 -> IGTPW_3995
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7811: f528982f5c837f075e82ca544df010ca5183064a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3995: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/index.html
  IGT_5384: fd6896567f7d612c76207970376d4f1e634ded55 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3995/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
