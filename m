Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 07:09:53 -0000
Message-ID: <158209619321.21060.5167287093269139449@emeril.freedesktop.org>
References: <20200217145042.829-1-petri.latvala@intel.com>
In-Reply-To: <20200217145042.829-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Refactor_timeouting?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Refactor timeouting
URL   : https://patchwork.freedesktop.org/series/73539/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7955_full -> IGTPW_4166_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4166_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4166_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4166_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb1/igt@gem_exec_suspend@basic-s3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_hdr@bpc-switch-suspend}:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4166_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-apl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7] ([fdo#103665])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-kbl1/igt@gem_ctx_isolation@vcs1-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl3/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [PASS][8] -> [INCOMPLETE][9] ([i915#61] / [i915#694])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw6/igt@gem_exec_parallel@rcs0-fds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw4/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112080]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb1/igt@gem_exec_parallel@vcs1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb7/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb3/igt@gem_exec_schedule@independent-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb2/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#694]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw8/igt@gem_linear_blits@normal.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw5/igt@gem_linear_blits@normal.html

  * igt@gem_mmap_gtt@basic-write-gtt:
    - shard-snb:          [PASS][18] -> [DMESG-WARN][19] ([i915#478])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-snb2/igt@gem_mmap_gtt@basic-write-gtt.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-snb7/igt@gem_mmap_gtt@basic-write-gtt.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#716])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#96])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#899])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#173])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb7/igt@kms_psr@no_drrs.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_render:
    - shard-tglb:         [PASS][28] -> [SKIP][29] ([i915#668])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-tglb5/igt@kms_psr@psr2_primary_render.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-tglb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][32] ([fdo#112080]) -> [PASS][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb8/igt@gem_ctx_isolation@vcs1-reset.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][34] ([fdo#110841]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][36] ([fdo#112146]) -> [PASS][37] +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][38] ([fdo#112271]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-tglb6/igt@gem_exec_balancer@hang.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd1:
    - shard-iclb:         [SKIP][40] ([fdo#109276]) -> [PASS][41] +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][42] ([i915#644]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][44] ([fdo#111870] / [i915#478]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-hsw:          [INCOMPLETE][48] ([i915#61]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][50] ([i915#79]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [FAIL][54] ([i915#49]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][56] ([i915#899]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][58] ([i915#694]) -> [FAIL][59] ([i915#818])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw4/igt@gem_tiled_blits@interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][60] ([i915#818]) -> [INCOMPLETE][61] ([i915#61])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-hsw1/igt@gem_tiled_blits@normal.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][62] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][63] ([fdo#111870] / [i915#478])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-snb7/igt@gem_userptr_blits@dmabuf-unsync.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][64] ([i915#974]) -> ([FAIL][65], [FAIL][66]) ([i915#716] / [i915#974])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7955/shard-kbl1/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl1/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5445 -> IGTPW_4166
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7955: 429740c5a92b11e3b649edb3ed4fd66237bd323e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4166: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html
  IGT_5445: 21e523814d692978d6d04ba85eadd67fcbd88b7e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
