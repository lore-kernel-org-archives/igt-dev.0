Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 23:31:11 -0000
Message-ID: <158457427180.25100.5232497331733658410@emeril.freedesktop.org>
References: <20200318201631.14580-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200318201631.14580-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Avoid_CRC_buffer_overflows?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane_multiple: Avoid CRC buffer overflows
URL   : https://patchwork.freedesktop.org/series/74846/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8154_full -> IGTPW_4322_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4322_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4322_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4322_full:

### IGT changes ###

#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][1] ([i915#478]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4322_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +24 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw1/igt@gem_mmap_gtt@big-copy-odd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw1/igt@gem_mmap_gtt@big-copy-odd.html
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-snb4/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112080]) +9 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][27] ([fdo#112080]) -> [PASS][28] +12 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][29] ([fdo#109276] / [i915#677]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][31] ([i915#677]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][33] ([fdo#112146]) -> [PASS][34] +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][35] ([i915#644]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][37] ([fdo#111870]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][39] ([fdo#111870] / [i915#478]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][41] ([i915#151] / [i915#155]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb6/igt@i915_pm_rps@reset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-apl4/igt@i915_suspend@forcewake.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_atomic@plane_overlay_legacy:
    - shard-snb:          [SKIP][47] ([fdo#109271]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-snb6/igt@kms_atomic@plane_overlay_legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-snb2/igt@kms_atomic@plane_overlay_legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][51] ([i915#57]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][57] ([fdo#112015]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][61] ([fdo#109278]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +15 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][65] ([i915#478]) -> [DMESG-WARN][66] ([fdo#110789] / [i915#478])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][67] ([i915#468]) -> [FAIL][68] ([i915#454])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-snb:          [INCOMPLETE][69] ([i915#82]) -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-snb6/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-snb5/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][71] ([i915#92]) -> ([FAIL][72], [FAIL][73]) ([i915#1389] / [i915#1402] / [i915#92])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8154/shard-kbl1/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl1/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/shard-kbl4/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5522 -> IGTPW_4322
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8154: 937a904e393752c47b8dfdeed993f04fd75af74d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4322: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/index.html
  IGT_5522: bd2b01af69c9720d54e68a8702a23e4ff3637746 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4322/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
